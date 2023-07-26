class Lake < Formula
  desc "A thin wrapper to package https://github.com/takagi/lake for OSX using Homebrew."
  homepage "https://github.com/40ants/homebrew-lake"
  url "https://github.com/40ants/homebrew-lake/archive/v0.1.0.tar.gz"
  sha256 "3f27e587e1381eb1395defe52b74616dbfa726d87b84a1d9d2b2c09c13318c79"
  head ""

  depends_on "sbcl" => :build
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

  resource "edicl-cl-interpol" do
    url "http://dist.ultralisp.org/archive/1240/edicl-cl-interpol-20220727101107.tgz"
    sha256 "6f808e2fcc04468c9ec16099c45b2b68414a20ee0548aaad559d517ee0b20e62"
  end

  resource "edicl-cl-ppcre" do
    url "http://dist.ultralisp.org/archive/1239/edicl-cl-ppcre-20230614075200.tgz"
    sha256 "fcf1d505007aa0fce3d09752c5fd1459efbaae43fb80f06980e591c7ec393918"
  end

  resource "edicl-cl-unicode" do
    url "http://dist.ultralisp.org/archive/1241/edicl-cl-unicode-20210222215228.tgz"
    sha256 "8bbf6b8ff8d51caa9e3c329509345f59636cbd61e8c896112c792bbcbd3a0751"
  end

  resource "edicl-flexi-streams" do
    url "http://dist.ultralisp.org/archive/1242/edicl-flexi-streams-20220112225522.tgz"
    sha256 "bfbb31674c02abdea0ed8135e1894a2f743df4b03e8bab7db1506b90270d95f9"
  end

  resource "m2ym-cl-syntax" do
    url "http://dist.ultralisp.org/ultralisp/archive/m/m2ym-cl-syntax-20190319100142.tgz"
    sha256 "555a992d9264633ce4b0eac2df5746148a446dfe411b0532c9f55fe8036f285d"
  end

  resource "m2ym-trivial-types" do
    url "http://dist.ultralisp.org/ultralisp/archive/m/m2ym-trivial-types-20190318184855.tgz"
    sha256 "0b05aab17b8ef14d7576ac554a2ee30e52d848e7c95dcd0c27d7a357c3110351"
  end

  resource "melisgl-named-readtables" do
    url "http://dist.ultralisp.org/archive/507/melisgl-named-readtables-20230724223412.tgz"
    sha256 "402dce39a1e4f1639b9d5079ef6d059c355d78089922b25f5bc95f2f9f71a568"
  end

  resource "quicklisp-quicklisp-client" do
    url "http://dist.ultralisp.org/archive/1254/quicklisp-quicklisp-client-20210216010650.tgz"
    sha256 "d8e39e878da43e54ea69194c075da371e57c7c76f01000d541dc43e3c3ee6721"
  end

  resource "sharplispers-split-sequence" do
    url "http://dist.ultralisp.org/archive/273/sharplispers-split-sequence-20211208061629.tgz"
    sha256 "98c27530444a65fcdc71f2dc539a252efa977f1a2ebfd6a0453ddfa572ca1d83"
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

  resource "takagi-lake" do
    url "http://dist.ultralisp.org/archive/638/takagi-lake-20220115185626.tgz"
    sha256 "18c5e3335881467b889edf6cf2a9dd0c86d78fab917c5f50041e23d57b580e2c"
  end

  resource "trivial-features-trivial-features" do
    url "http://dist.ultralisp.org/archive/197/trivial-features-trivial-features-20230614074348.tgz"
    sha256 "6dab2a6ee703a8d444d3e0438afc838138a8943c4ae1640cc5d710dabba35b34"
  end

  resource "trivial-gray-streams-trivial-gray-streams" do
    url "http://dist.ultralisp.org/archive/194/trivial-gray-streams-trivial-gray-streams-20230630171731.tgz"
    sha256 "52883684b77d874de095dd56752dda1226a54030b5ede28a3ae71de0ee93e284"
  end

  resource "uiop" do
    url "http://beta.quicklisp.org/archive/uiop/2023-06-18/uiop-3.3.6.tgz"
    sha256 "302acb92b985b4b44a2ae2bdcc0d385084138c17acaf2cdc7ed2dc155172ec70"
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
  (ASDF/OPERATE:MAKE \"homebrew-lake\"))"

    system "bash", "-c", "mkdir dyn-libs && find bin/ -name '*.dylib' -exec mv '{}' dyn-libs/ \\;"

    bin.install Dir["bin/*"]
    libexec.install Dir["dyn-libs/*"]
  end
end
