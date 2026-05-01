# SMO Flow

A Ruby library for calculating subcatchment output flow using component-based drainage calculations.

Created by Sebastian Madrid Ontiveros.

## Overview

SMO Flow provides a simple, transparent, and developer-friendly toolkit for estimating flow contributions from different parts of a subcatchment, such as roads, roofs, permeable areas, foul flow, and trade flow.

The initial version focuses on timestep-based Rational Method runoff calculations.

## Installation

Add this line to your application's Gemfile:

````gem 'smo_flow'```

Or install it directly:

```bash
gem install smo_flow
```

## Usage

### Rational Method — Flow from Rainfall Intensity

```ruby
require "smo_flow"

calc = SmoFlow::RationalMethod.new(coefficient: 0.9, area: 2.5)

# Flow in m³/s
calc.flow_from_intensity(50.0)   # => 0.3125

# Flow in L/s
calc.flow_ls_from_intensity(50.0)  # => 312.5
```

### Flow from Rainfall Depth and Timestep

```ruby
calc = SmoFlow::RationalMethod.new(coefficient: 0.9, area: 2.5)

# Flow in m³/s from 5mm of rain over 1 hour
calc.flow_from_depth(depth: 5.0, timestep: 3600.0)  # => 0.03125
```

### Multiple Subcatchments

```ruby
road  = SmoFlow::RationalMethod.new(coefficient: 0.9, area: 1.5)
roof  = SmoFlow::RationalMethod.new(coefficient: 0.95, area: 0.8)
grass = SmoFlow::RationalMethod.new(coefficient: 0.3, area: 2.0)

intensity = 50.0  # mm/hr

total = road.flow_from_intensity(intensity) +
        roof.flow_from_intensity(intensity) +
        grass.flow_from_intensity(intensity)
```

### Convert Depth to Intensity

```ruby
calc.depth_to_intensity(depth: 5.0, timestep: 3600.0)  # => 5.0 mm/hr
```

### Runoff Volume

```ruby
calc.volume(depth: 5.0)  # => 112.5 m³
```

## Formulas

### Flow from Intensity
````
Q = C × i × A / 360