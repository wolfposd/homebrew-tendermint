require 'formula'

class Tendermint < Formula
  homepage 'https://github.com/tendermint/tendermint'
  url 'https://github.com/tendermint/tendermint.git', :tag => 'v0.11.o'

  devel do
    url 'https://github.com/tendermint/tendermint.git', :branch => 'master'
  end

  depends_on 'go' => :build
  depends_on 'glide' => :glide

  def install
    ENV["GOROOT"] = "#{HOMEBREW_PREFIX}/opt/go/libexec"
    system "go", "env" # Debug env
    system "make", "get_vendor_deps"
    system "make", "build"
    bin.install 'build/bin/tendermint'
  end

  test do
    system "#{HOMEBREW_PREFIX}/bin/tendermint", "version"
  end
end
