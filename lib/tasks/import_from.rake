namespace :import_from do
  desc "TODO"
  task csv: :environment do

  	puts "Read CSV."
	values = CSV.read(Rails.root.join("nacimientos.csv"))
	columns = values.first.map {|name| name.to_sym }
	puts "Columns: #{columns}"
	values.shift
	puts "Deleting existing data."
	BornAmount.delete_all
	puts "Importing data to BornAmount model."
	BornAmount.import columns, values, validate: false, on_duplicate_key_update: { conflict_target: [:id] }
	puts "#{BornAmount.count} rows were imported."
  end

end
