# config.ru
$: << File.expand_path(File.dirname(__FILE__))

require "app/request_sandbox"
run RequestSandbox::App


