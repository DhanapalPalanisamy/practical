RSpec.configure do |config|
  config.include AllureRSpec::Adaptor

  config.before(:each) do
    driver = Selenium::WebDriver.for :chrome
  end

  config.after(:each) do |example|
    if example.exception
      example.attach_file('screenshot', File.new(
          driver.save_screenshot(File.join(Dir.pwd, "results/#{UUID.new.generate}.png"))))
    end

    driver.quit
  end
end

AllureRSpec.configure do |config|
  config.output_dir = 'results'
  config.clean_dir = true # this is the default value
end


describe "Reporting" do
  it 'passes' do
    expect(true).to eql true
  end
  it 'fails' do
    expect(true).to eql false
  end
end
