require 'RIUI'

@image = RIImage.new(x: 500, y: 275, image: "tree.png", width: 100, height: 75)

def onclick
  @image.setSize(width: @orig_w, height: @orig_h)
  @slider1.reset
  @slider2.reset
end
def on_slider1_change
  @image.setSize(height: @slider1.value + @orig_h, width: @slider2.value + @orig_w)
end

def on_slider2_change
  @image.setSize(height: @slider1.value + @orig_h, width: @slider2.value + @orig_w)
end

actions = RIActions.new
onclick = method(:onclick)
@button1 = RIButton.new(x: 125, y: 100, width: 150, height: 100, color: "green", hover_color: "blue")
@button1.onClick(onclick: onclick)

@button1.setLabel(text: "Reset", font: "SF-PRO-Text-Bold.otf", size: 25, color: "white")

@slider1 = RISlider.new(length: 200, square_size: 10, x: 100, y: 250, ticks: 200)
@slider1.setColors(line_color: "black", square_color: "blue")
@slider1.setLabel(size: 20, font: 'SF-PRO-Text-Bold.otf', color: 'black')
slider1Change = method(:on_slider1_change)
@slider1.onChange(onchange: slider1Change)

@slider2 = RISlider.new(length: 200, square_size: 10, x: 100, y: 300, ticks: 200)
@slider2.setColors(line_color: "black", square_color: "blue")
@slider2.setLabel(size: 20, font: 'SF-PRO-Text-Bold.otf', color: 'black')
slider2Change = method(:on_slider2_change)
@slider2.onChange(onchange: slider2Change)


actions.add(@slider1)
actions.add(@slider2)
actions.add(@button1)
@orig_h = @image.height
@orig_w = @image.width





extend Ruby2D::DSL
set background: 'white'
set title: 'RIUI Example'
show

  #on :mouse_down do |e|
  #  if button1.contains(e.x, e.y)
  #    puts 'Reset'
  #    image.setSize(width: @orig_w, height: @orig_h)
  #    slider1.reset
  #    slider2.reset
  #  end
  #end
  #update do
  #  slider1.update_actions
  #  slider2.update_actions
  #  if(slider1.active || slider2.active)
  #    image.setSize(height: slider1.value + @orig_h, width: slider2.value + @orig_w)
  #  end
  #end
