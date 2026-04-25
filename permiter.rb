# typed: false
# frozen_string_literal: true

class Permiter < Formula
  desc "iptables-inspired permissions hook for Claude Code"
  homepage "https://github.com/davidpanter/permiter"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/davidpanter/permiter/releases/download/v0.2.0/permiter-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "4a3bc2f1260327f6eac22a659306c23a3987d5e7afcb56474ca805f76c6a92f0"

      define_method(:install) do
        bin.install "permiter"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/davidpanter/permiter/releases/download/v0.2.0/permiter-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "0e6ae36a1e8375833a893ceac730270223112d90a0a69a9feaba08809da74e85"

      define_method(:install) do
        bin.install "permiter"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/davidpanter/permiter/releases/download/v0.2.0/permiter-v0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c27edb6267da2c35c19e97c7631e6ed75b3bd3be415d9b14a26bdd35e535d592"

      define_method(:install) do
        bin.install "permiter"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/permiter --version")
  end
end
