require('minitest/autorun')
require('minitest/reporters')
require_relative('../bar')
require_relative('../rooms')
require_relative('../customers')
require_relative('../songs')


Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestBar < MiniTest::Test

end
