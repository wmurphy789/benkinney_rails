RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  config.before(:suite) do
    # Test factories in spec/factories are working.
    begin
    	DatabaseCleaner.start
    	FactoryGirl.lint
    ensure
		  DatabaseCleaner.clean
    end
  end

end