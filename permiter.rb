# typed: false
# frozen_string_literal: true

class Permiter < Formula
  desc "iptables-inspired permissions hook for Claude Code"
  homepage "https://github.com/davidpanter/permiter"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/davidpanter/permiter/releases/download/v0.1.0/permiter-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "221cf3f5aad1322e92a26054aa45e77e7011426b11f821d8b9e879b75749b7c4"

      define_method(:install) do
        bin.install "permiter"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/davidpanter/permiter/releases/download/v0.1.0/permiter-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "63a3e2758a68129a164026a79d86c73fa444e223460034da31f691f83486dc2e"

      define_method(:install) do
        bin.install "permiter"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/davidpanter/permiter/releases/download/v0.1.0/permiter-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5a26e676109ebc5cff8ff8612b2eafb66d5bad08220d7a8e146719e3cc11ba98"

      define_method(:install) do
        bin.install "permiter"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/permiter --version")
  end
end
