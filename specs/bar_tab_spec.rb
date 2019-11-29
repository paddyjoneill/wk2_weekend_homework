require('minitest/autorun')
require('minitest/reporters')
require_relative('../bar_tab')
require_relative('../rooms')
require_relative('../customers')
require_relative('../songs')


Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestBarTab < MiniTest::Test

end
