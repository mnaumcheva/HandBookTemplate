Given /^The ([^"]+) book/ do |book|
    $source = "#{book}.adoc"
  end
  
  Then('No reference should include the Goals book') do
    f = File.new($source)
    text = f.read
    expect(text =~ /<<g.*-/).to be nil
  end

  Then('No reference should include the Project book') do
    f = File.new($source)
    text = f.read
    expect(text =~ /<<p.*-/).to be nil
  end

  Then('No reference should include the System book') do
    f = File.new($source)
    text = f.read
    expect(text =~ /<<s.*-/).to be nil
  end

  Then('Only E.5 section can refer to the System book') do
    # TBC
    f = File.new($source)
    text = f.read
    expect(text =~ /<<s.*-/).to be nil
end
