def nyc_pigeon_organizer(data)
  new_hash = {}

  # Get unique names
  names = data.collect do |category, list_of_catagory_items|
    list_of_catagory_items.values
  end.flatten.uniq

  # Create key with each name as a string pointing to empty hash
  names.each do |name|
    new_hash[name] = {}
  end

  # Create categories for each pidgeon and point each catergory to empty array
  data.each do |category, list_of_catagory_items|
    new_hash.each do |name, empty_hash|
      new_hash[name][category] = []
    end
  end

  # Populate each pidgeon's categories
  data.each do |category, list_of_catagory_items|
    new_hash.each do |name, hash|
      list_of_catagory_items.each do |key, value|
        if value.include? name
          new_hash[name][category]<<key.to_s
        end
      end
    end
  end

  new_hash
end
