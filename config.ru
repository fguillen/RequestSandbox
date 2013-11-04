# config.ru
$: << File.expand_path(File.dirname(__FILE__))

require "app/sinatra_skeleton/app"
run SinatraSkeleton::App


