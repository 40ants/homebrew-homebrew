class TestBrewApp < Formula
  desc "An application to test cl-brewer"
  homepage "https://github.com/svetlyak40wt/test-brew-app"
  url "https://github.com/svetlyak40wt/test-brew-app/archive/v0.2.0.tar.gz"
  sha256 "20c5077d81b53b5775ffdab5bd74d0ff88e06b1c09a28a9dd36e2a4abd567fb6"
  head "https://github.com/svetlyak40wt/test-brew-app"

  depends_on "sbcl" => :build
  # required by: CL+SSL/CONFIG::LIBCRYPTO and CL+SSL/CONFIG::LIBSSL
  depends_on "openssl@3"
  # required by: DEPLOY::COMPRESSION-LIB
  depends_on "zstd"

  resource "40ants-40ants-asdf-system" do
    url "http://dist.ultralisp.org/archive/1825/40ants-40ants-asdf-system-20230210163819.tgz"
    sha256 "3d733cc66520132ce0743ca2b363e1806c0311c8fb128e77d8af0ef0fb8638ee"
  end

  resource "40ants-cl-brewer" do
    url "http://dist.ultralisp.org/archive/1977/40ants-cl-brewer-20230714194939.tgz"
    sha256 "545c9a4a03254a96a0608f91d4f4c82439993be4433503d5202511cd66eedf3b"
  end

  resource "40ants-cl-plus-ssl-osx-fix" do
    url "http://dist.ultralisp.org/archive/1962/40ants-cl-plus-ssl-osx-fix-20230618185126.tgz"
    sha256 "f26673e427545bfc7affae80d14d74a78c6b5f17b1a68d4a38c6223e894f92bb"
  end

  resource "alexandria" do
    url "http://beta.quicklisp.org/archive/alexandria/2023-06-18/alexandria-20230618-git.tgz"
    sha256 "d5fbb349204082b61a7a6c58aed1d1606e524bfa38ecd0ec6ebed7f658061819"
  end

  resource "cffi" do
    url "http://beta.quicklisp.org/archive/cffi/2023-06-18/cffi-20230618-git.tgz"
    sha256 "223f9fa6f1c50df1a8d5b7db0d02c520a4454965ed1a996cf5a6d20f447058c3"
  end

  resource "cl+ssl" do
    url "http://beta.quicklisp.org/archive/cl+ssl/2023-06-18/cl+ssl-20230618-git.tgz"
    sha256 "c5653c3d96b169003a386628cf0c92aaf256ba27377f569fe45e4e1012c80343"
  end

  resource "cl-babel-babel" do
    url "http://dist.ultralisp.org/archive/1237/cl-babel-babel-20230131043757.tgz"
    sha256 "cd3c1154be061834514a41ccc826735edfdf376ea9124e338f54209861a8a1b1"
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

  def install
    resources.each do |resource|
      resource.stage buildpath/"lib"/resource.name
    end

    ENV["LIBEXEC_PATH"] = "#{libexec}/"
    ENV["CL_SOURCE_REGISTRY"] = "#{buildpath}/lib//:#{buildpath}//"
    ENV["ASDF_OUTPUT_TRANSLATIONS"] = "/:/"

    system "sbcl", "--eval", "(require :asdf)", "--eval", "(push :deploy-console *features*)", "--eval", "(asdf:load-system :cl-brewer/deploy/hooks)", "--eval", "(handler-case (asdf:make :test-brew-app) (error () (uiop:quit 1)))"

    system "bash", "-c", "mkdir dyn-libs && find bin/ -name '*.dylib' -exec mv '{}' dyn-libs/ \\;"

    bin.install Dir["bin/*"]
    libexec.install Dir["dyn-libs/*"]
  end
end
