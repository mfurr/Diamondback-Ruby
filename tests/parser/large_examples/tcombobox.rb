#
#  tcombobox widget
#                               by Hidetoshi NAGAI (nagai@ai.kyutech.ac.jp)
#
require 'tk'
require 'tkextlib/tile.rb'

module Tk
  module Tile
    class TCombobox < Tk::Tile::TEntry
    end
    Combobox = TCombobox
  end
end

class Tk::Tile::TCombobox < Tk::Tile::TEntry
  include Tk::Tile::TileWidget

  if Tk::Tile::USE_TTK_NAMESPACE
    TkCommandNames = ['::ttk::combobox'.freeze].freeze
  else
    TkCommandNames = ['::tcombobox'.freeze].freeze
  end
  WidgetClassName = 'TCombobox'.freeze
  WidgetClassNames[WidgetClassName] = self

  def __boolval_optkeys
    super() << 'exportselection'
  end
  private :__boolval_optkeys

  def __listval_optkeys
    super() << 'values'
  end
  private :__listval_optkeys

  def self.style(*args)
    [self::WidgetClassName, *(args.map!{|a| _get_eval_string(a)})].join('.')
  end

  def current
    number(tk_send_without_enc('current', idx))
  end
  def current=(idx)
    tk_send_without_enc('current', idx)
  end

  def identify(x, y)
    tk_send_without_enc('identify', x, y)
  end

  def set(val)
    tk_send('set', val)
  end
end
