begin
  require 'metric_fu'
  MetricFu::Configuration.run do |config|
    config.metrics = [:flog]
  end
rescue LoadError  
end
