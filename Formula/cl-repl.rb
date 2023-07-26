class ClRepl < Formula
  desc "A thin wrapper to package https://github.com/fstamour/cl-repl for OSX using Homebrew."
  homepage "https://github.com/svetlyak40wt/homebrew-cl-repl"
  url "https://github.com/svetlyak40wt/homebrew-cl-repl/archive/v0.6.4.tar.gz"
  sha256 "06523636ec7bd8c7fb9544411ba30c59e096fbca2c0fac33dc9bdb39a7313572"
  head ""

  depends_on "sbcl" => :build
  # required by: CL-READLINE:READLINE
  depends_on "readline"
  # required by: DEPLOY::COMPRESSION-LIB
  depends_on "zstd"

  resource "40ants-cl-brewer" do
    url "http://dist.ultralisp.org/archive/1977/40ants-cl-brewer-20230725165337.tgz"
    sha256 "10b4d88c0d79a920230b012a8b3e12ef544534003d507e70da753ea44893bff9"
  end

  resource "alexandria" do
    url "http://beta.quicklisp.org/archive/alexandria/2023-06-18/alexandria-20230618-git.tgz"
    sha256 "d5fbb349204082b61a7a6c58aed1d1606e524bfa38ecd0ec6ebed7f658061819"
  end

  resource "cffi" do
    url "http://beta.quicklisp.org/archive/cffi/2023-06-18/cffi-20230618-git.tgz"
    sha256 "223f9fa6f1c50df1a8d5b7db0d02c520a4454965ed1a996cf5a6d20f447058c3"
  end

  resource "cl-babel-babel" do
    url "http://dist.ultralisp.org/archive/1237/cl-babel-babel-20230131043757.tgz"
    sha256 "cd3c1154be061834514a41ccc826735edfdf376ea9124e338f54209861a8a1b1"
  end

  resource "edicl-cl-ppcre" do
    url "http://dist.ultralisp.org/archive/1239/edicl-cl-ppcre-20230614075200.tgz"
    sha256 "fcf1d505007aa0fce3d09752c5fd1459efbaae43fb80f06980e591c7ec393918"
  end

  resource "fstamour-cl-repl" do
    url "http://dist.ultralisp.org/ultralisp/archive/f/fstamour-cl-repl-20200329233413.tgz"
    sha256 "94bf20f498ba05c088eea581e235a79af6b2ce8cf4bc05fc85efb198d271108f"
  end

  resource "libre-man-unix-opts" do
    url "http://dist.ultralisp.org/archive/139/libre-man-unix-opts-20210111202438.tgz"
    sha256 "ed4b126283b23dab16632b86fce8b94eced4d428da5fe451214e4c345518adba"
  end

  resource "pcostanza-closer-mop" do
    url "http://dist.ultralisp.org/archive/952/pcostanza-closer-mop-20230710201122.tgz"
    sha256 "6f2b9eef348174aa1aa99063fe011e01216127ed0ee29a73bab58d20ad1c6436"
  end

  resource "quicklisp-quicklisp-client" do
    url "http://dist.ultralisp.org/archive/1254/quicklisp-quicklisp-client-20210216010650.tgz"
    sha256 "d8e39e878da43e54ea69194c075da371e57c7c76f01000d541dc43e3c3ee6721"
  end

  resource "sharplispers-conium" do
    url "http://dist.ultralisp.org/archive/910/sharplispers-conium-20210611213021.tgz"
    sha256 "312b4d2be9f3bfa00f796e252ec81de99a3d14626fad8505c2abf494354bd44e"
  end

  resource "Shinmera-deploy" do
    url "http://dist.ultralisp.org/archive/858/Shinmera-deploy-20230710201211.tgz"
    sha256 "1ad782e17010c250f69965b514add3cc5fffa3fddba3066c9d062007905c462b"
  end

  resource "Shinmera-documentation-utils" do
    url "http://dist.ultralisp.org/archive/843/Shinmera-documentation-utils-20230711001755.tgz"
    sha256 "e8d287de786216763a2fafbc7d18da539b7a124497b8529f066c33f0148f2182"
  end

  resource "Shinmera-trivial-indent" do
    url "http://dist.ultralisp.org/archive/193/Shinmera-trivial-indent-20230710204252.tgz"
    sha256 "7b4c8b6db7250fb2794a79967fcb5c0410146b206233e43227b708d92d3ec944"
  end

  resource "trivial-features-trivial-features" do
    url "http://dist.ultralisp.org/archive/197/trivial-features-trivial-features-20230614074348.tgz"
    sha256 "6dab2a6ee703a8d444d3e0438afc838138a8943c4ae1640cc5d710dabba35b34"
  end

  resource "uiop" do
    url "http://beta.quicklisp.org/archive/uiop/2023-06-18/uiop-3.3.6.tgz"
    sha256 "302acb92b985b4b44a2ae2bdcc0d385084138c17acaf2cdc7ed2dc155172ec70"
  end

  resource "vindarel-cl-readline" do
    url "http://dist.ultralisp.org/archive/35/vindarel-cl-readline-20230721231323.tgz"
    sha256 "0f16312a088279ae7bec3d98148b519673c74f9b61f5d6fa330034bb55fa5d93"
  end

  def install
    resources.each do |resource|
      resource.stage buildpath/"_brew_resources"/resource.name
    end

    ENV["LIBEXEC_PATH"] = "#{libexec}/"
    ENV["CL_SOURCE_REGISTRY"] = "#{buildpath}/:#{buildpath}/_brew_resources//"
    ENV["ASDF_OUTPUT_TRANSLATIONS"] = "/:/"

    system "sbcl", "--eval", "(require :asdf)", "--eval", "(push :deploy-console *features*)", "--eval", "(asdf:load-system :cl-brewer-deploy-hooks)", "--eval", "(HANDLER-BIND ((ERROR
                (LAMBDA (E)
                  (UIOP/IMAGE:PRINT-BACKTRACE :CONDITION E)
                  (UIOP/IMAGE:QUIT 1)))
               (WARNING #'MUFFLE-WARNING))
  (ASDF/OPERATE:LOAD-SYSTEM \"quicklisp-starter\"))", "--eval", "(HANDLER-BIND ((ERROR
                (LAMBDA (E)
                  (UIOP/IMAGE:PRINT-BACKTRACE :CONDITION E)
                  (UIOP/IMAGE:QUIT 1)))
               (WARNING #'MUFFLE-WARNING))
  (ASDF/OPERATE:MAKE \"homebrew-cl-repl\"))"

    system "bash", "-c", "mkdir dyn-libs && find bin/ -name '*.dylib' -exec mv '{}' dyn-libs/ \\;"

    bin.install Dir["bin/*"]
    libexec.install Dir["dyn-libs/*"]
  end
end
