class ReorderCategoriesJob < ApplicationJob
	include ApplicationHelper
  queue_as :default

  $score = 0

  def perform()
  	cs = Category.arrange(:order => :name)
    $score = 0
    dfs_traverse(cs)
  end

  def dfs_traverse(cs)
    cs.each do |cat, cat2|
      p "Cat: #{cat.name}"
      p "Cat2: #{cat2}"
      cat.ordering = $score
      $score = $score + 1
      cat.save
      dfs_traverse(cat2)
    end
  end
end