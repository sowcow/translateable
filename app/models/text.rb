class Text < ActiveRecord::Base
  has_ancestry

  extend FriendlyId
  friendly_id :title, use: :finders

  def self.root
    Text.where(title: ROOT).first_or_create
  end
  ROOT = 'root'

  after_create do
    unless parent
      self.parent = Text.root
      save
    end
  end

  # ancestry stuff:
  #
  ARRANGE = { order: 'title' }

  def self.arrange_as_array(hash)
    arr = []
    hash.each do |node, children|
      arr << [node.name_for_selects, node.id]
      arr += arrange_as_array(children) unless children.nil?
    end
    arr
  end

  NBSP = 0xC2.chr + 0xA0.chr
  INDENT = NBSP*3  #?∙ #'·' * 2 #—
  def name_for_selects
    "#{INDENT * depth} #{title}"
  end

  def possible_parents
    Text.arrange ARRANGE
    #parents = Text.arrange_as_array Text.arrange ARRANGE
    #return new_record? ? parents : parents - subtree
  end

  def arrange_as_array
    Text.arrange_as_array possible_parents
  end
end
