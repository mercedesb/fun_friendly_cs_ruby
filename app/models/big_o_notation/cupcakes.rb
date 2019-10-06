# frozen_string_literal: true

class BigONotation::Cupcakes
  attr_reader :recipe_ratios

  def initialize
    @recipe_ratios = {
      butter: { name: 'butter', number: 1, measurement: 'C.' },
      sugar: { name: 'sugar', number: 2, measurement: 'C.' },
      eggs: { name: 'eggs', number: 4, measurement: '' },
      flour: { name: 'flour', number: 3, measurement: 'C.' },
      baking_powder: { name: 'baking powder', number: 1, measurement: 'tbsp' },
      milk: { name: 'milk', number: 1, measurement: 'C.' }
    }
  end

  # O(1)
  def preheat_oven(number_of_batches)
    "Preheating oven to 350 degrees to make #{number_of_batches} batches of cupcakes: O(1)"
  end

  # O(1)
  def combine_butter_and_sugar(number_of_batches)
    steps = []
    butter = {
      ingredient: recipe_ratios[:butter],
      amount: number_of_batches * recipe_ratios[:butter][:number]
    }
    sugar = {
      ingredient: recipe_ratios[:sugar],
      amount: number_of_batches * recipe_ratios[:sugar][:number]
    }

    steps << beat_with_electric_mixer([butter, sugar], 3)
    steps << 'Combined butter and sugar: O(1)'
    steps.join('<br/>')
  end

  # O(n)
  def add_eggs(number_of_batches)
    steps = []
    one_egg = { ingredient: recipe_ratios[:eggs], amount: 1 }
    butter_mixture = { ingredient: 'butter mixture' }

    amount = number_of_batches * recipe_ratios[:eggs][:number]
    amount.times do
      steps << beat_with_electric_mixer([one_egg, butter_mixture], 1)
    end

    steps << 'Added eggs: O(n)'
    steps.join('<br/>')
  end

  # O(1)
  def combine_flour_and_baking_powder(number_of_batches)
    steps = []
    flour = {
      ingredient: recipe_ratios[:flour],
      amount: number_of_batches * recipe_ratios[:flour][:number]
    }
    baking_powder = {
      ingredient: recipe_ratios[:baking_powder],
      amount: number_of_batches * recipe_ratios[:baking_powder][:number]
    }

    steps << stir_with_spoon([flour, baking_powder])
    steps << 'Combined flour and baking powder: O(1)'
    steps.join('<br/>')
  end

  # O(n^2)
  def combine_flour_mixture_and_milk_and_butter_mixture(number_of_batches)
    steps = []
    butter_mixture = { ingredient: 'butter mixture' }
    flour_mixture = { ingredient: 'flour mixture' }
    milk = {
      ingredient: recipe_ratios[:milk],
      amount:
        (number_of_batches * recipe_ratios[:milk][:number]) / (number_of_batches * number_of_batches)
    }

    steps << beat_with_electric_mixer([butter_mixture, flour_mixture], 1)

    number_of_batches.times do
      number_of_batches.times do
        steps << beat_with_electric_mixer([butter_mixture, milk], 1)
        steps << beat_with_electric_mixer([butter_mixture, flour_mixture], 1)
      end
    end

    steps << 'Slowly combined milk, flour mixture, and butter mixture: O(n^2)'

    steps.join('<br/>')
  end

  # O(1)
  def bake
    'Poured into muffin tins. Baked for 28-30 minutes: O(1)'
  end

  # See private function calculate_fibonacci_number: O(2^n)
  def fibonacci_frosting(number_of_batches)
    number_to_frost = calculate_fibonacci_number(number_of_batches)
    "Iced the fibonacci number #{number_to_frost} to all of the cupcakes: O(2^n) (check out the console for the process)"
  end

  private

  def beat_with_electric_mixer(components, time_in_minutes)
    "Beating #{components.map { |c| get_ingredient_text(c) }.join(', ')} with mixer at medium speed for #{time_in_minutes} minutes"
  end

  def stir_with_spoon(components)
    "Stirring #{components.map { |c| get_ingredient_text(c) }.join(', ')} with spoon"
  end

  def get_ingredient_text(component)
    text = ''
    text += "#{component[:amount]} " if component.key?(:amount)
    text += if component[:ingredient].is_a?(Hash) && component[:ingredient].key?(:measurement)
              "#{component[:ingredient][:measurement]} "
            elsif component[:ingredient].is_a?(Hash) && component[:ingredient].key?(:name)
              component[:ingredient][:name]
            else
              component[:ingredient].to_s
            end
    text
  end

  # O(2^n)
  def calculate_fibonacci_number(number)
    if number <= 1
      puts 'Fibonacci base case!'
      number
    else
      puts "Adding fibonacci numbers #{number} and #{number - 1}"

      calculate_fibonacci_number(number - 1) + calculate_fibonacci_number(number - 2)
    end
  end
end
