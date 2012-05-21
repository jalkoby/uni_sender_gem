require 'spec_helper'

describe UniSender::Client do

  specify { test_client.get_lists.should == test_client.getLists }

end
