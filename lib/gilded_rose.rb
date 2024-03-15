class GildedRose
  attr_reader :name, :days_remaining, :quality

  def initialize(name:, days_remaining:, quality:)
    @name = name
    @days_remaining = days_remaining
    @quality = quality
  end

  def tick
    update_quality
    update_days_remaining
    post_date_quality_update if @days_remaining < 0
  end

  private

  def update_quality
    if @name == "Aged Brie"
      increase_quality
      increase_quality if @days_remaining <= 0
    elsif @name == "Backstage passes to a TAFKAL80ETC concert"
      if @days_remaining > 10
        increase_quality
      elsif @days_remaining > 5
        increase_quality(2)
      elsif @days_remaining > 0
        increase_quality(3)
      else
        @quality = 0
      end
    elsif @name != "Sulfuras, Hand of Ragnaros"
      decrease_quality
      decrease_quality if @days_remaining <= 0
    end
  end

  def update_days_remaining
    @days_remaining -= 1 unless @name == "Sulfuras, Hand of Ragnaros"
  end

  def post_date_quality_update
    # This method remains empty for now, intended for future logic
  end

  def increase_quality(amount = 1)
    @quality += amount if @quality < 50
  end

  def decrease_quality(amount = 1)
    @quality -= amount if @quality > 0
  end
end
