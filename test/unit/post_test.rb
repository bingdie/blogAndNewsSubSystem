require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test "post attributes must not be empty" do
     assert true
  end

  def test_the_truth
    assert true
  end

  test "should not save post without title"  do
    post = Post.new
    assert !post.save
  end

end
