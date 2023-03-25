{{PROBLEM}} Golden Square Solo Takeaway Challenge planning

1. Describe the Problem

> As a customer
> So that I can check if I want to order something
> I would like to [see] a [list] of [dishes] with [prices].

> As a customer
> So that I can [order] the meal I want
> I would like to be able to [select] some [number] of several available [dishes].

> As a customer
> So that I can verify that my order is correct
> I would like to [see] an [itemised] [receipt] with a grand [total].

Use the twilio-ruby gem to implement this next one. You will need to use doubles too.

> As a customer
> So that I am reassured that my order will be delivered on time
> I would like to [receive] a [text] such as "Thank you! Your [order] was [placed] and will be [delivered] before 18:52" after I have ordered.

2. Design the Class System
Consider diagramming out the classes and their relationships. Take care to focus on the details you see as important, not everything. The diagram below uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com

![takeaway project design](../images/takeaway_design_mk2.png)

Also design the interface of each class in more detail.
```ruby
class MusicLibrary
  def initialize
    # ...
  end

  def add(track) # track is an instance of Track
    # Track gets added to the library
    # Returns nothing
  end

  def all
    # Returns a list of track objects
  end
  
  def search_by_title(keyword) # keyword is a string
    # Returns a list of tracks with titles that include the keyword
  end
end

class Track
  def initialize(title, artist) # title and artist are both strings
  end

  def format
    # Returns a string of the form "TITLE by ARTIST"
  end
end
```
1. Create Examples as Integration Tests


# EXAMPLE
> get menu with dishes => 
```ruby

```
4. Create Examples as Unit Tests
Create examples, where appropriate, of the behaviour of each relevant class at a more granular level of detail.

# EXAMPLE
```ruby

```
5. Implement the Behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.
