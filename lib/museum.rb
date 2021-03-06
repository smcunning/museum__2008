class Museum
attr_reader :name,
            :exhibits,
            :patrons
  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    result = []
    @exhibits.each do |exhibit|
      patron.interests.each do |interest|
        if exhibit.name == interest
          result << exhibit
        end
      end
    end
    result
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    result = {}
    @exhibits.each do |exhibit|
      @patrons.each do |patron|
          if patron.interests.include?(exhibit.name)
            result[exhibit] << patron
          else
            result[exhibit] = [patron]
          end
        end
      end
      result
    end
  
  def ticket_lottery_contestants(exhibit)
    result = []
    patrons_by_exhibit_interest[exhibit].each do |patrons|
        patrons.each do |patron|
          if exhibit.cost > patron.spending_money
            result << patron
          end
        end
      end
      result
  end

end
