class Contact < ActiveRecord::Base

  def self.list
    data = self.all
    puts "list          Name          Phone          Address"
    puts "====          ====          =====          ===================="
    data.each do |item|
      puts "#{item.id}.            #{item.name}     #{item.phone}     #{item.house_number}, #{item.street}, #{item.zipcode}, #{item.state}"
    end
  end

  def self.add_contact(info = {})
    @name = info[:name]
    @phone = info[:phone]
    @house_number = info[:house_number]
    @street = info[:street]
    @zipcode = info[:zipcode]
    @state = info[:state]

    Contact.create(name: @name, phone: @phone, house_number: @house_number, street: @street, zipcode: @zipcode, state: @state)

    renumber_index
  end

  def self.renumber_index

    data = self.all
    counter = 1
    data.each do |item|
      item.update(id: counter)
      counter +=1
    end
  end
  
  def self.update_contact (id, info = {})
    @name = info[:name]
    @phone = info[:phone]
    @house_number = info[:house_number]
    @street = info[:street]
    @zipcode = info[:zipcode]
    @state = info[:state]

    data = self.where(id: id)

    data.each do |item|
      item.update(name: @name, phone: @phone, house_number: @house_number, street: @street, zipcode: @zipcode, state: @state)
    end
  end
  
  def self.delete_contact(id)
    data = self.find_by(id: id)
    data.destroy

    renumber_index
  end

end
