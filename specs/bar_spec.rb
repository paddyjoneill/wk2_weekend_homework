require('minitest/autorun')
require('minitest/reporters')
require_relative('../drink')
require_relative('../bar')



Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class TestBar < MiniTest::Test

end
