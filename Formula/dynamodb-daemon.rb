class DynamodbDaemon < Formula
  desc "Locally-hosted DynamoDB server"
  homepage "https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DynamoDBLocal.html"
  #url "https://dynamodb-local.s3.amazonaws.com/dynamodb_local_latest.tar.gz"
  url "https://raw.githubusercontent.com/DFStudio/homebrew-dfstudio/artifacts/dynamodb-daemon/DynamoDBLocal_complete-1.18.0.tar.gz"
  version "1.18.0"
  sha256 "628d9a3c413c9328239def1277e7722b25f0cbe36ce045b3e0c3f41b445c418e"
  #license ""

  # depends_on "openjdk"

  def install
    libexec.install "DynamoDBLocal_lib"
    libexec.install "jre"
    (bin/"dynamodb-local").write <<~EOS
      #!/bin/bash
      export JAVA_HOME="#{libexec}/jre"
      exec "${JAVA_HOME}/bin/java" -Djava.library.path='#{libexec}/DynamoDBLocal_lib' -classpath '#{libexec}/DynamoDBLocal_lib/*' com.amazonaws.services.dynamodbv2.local.main.ServerRunner "$@"
    EOS
  end

  def post_install
    (var/"log").mkpath
    dynamodb_db_path.mkpath
  end

  def dynamodb_run_path
    var/name
  end

  def dynamodb_db_path
    dynamodb_run_path/"data"
  end

  def dynamodb_log_path
    var/"log/#{name}.log"
  end

  service do
    run [bin/"dynamodb-local", "--port", "8800", "--dbPath", f.dynamodb_db_path]
    keep_alive true
    log_path f.dynamodb_log_path
    error_log_path f.dynamodb_log_path
    working_dir f.dynamodb_run_path
  end
end
