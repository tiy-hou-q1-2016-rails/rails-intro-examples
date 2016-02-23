# to run this, run `rake db:create`
# to run this, and  `rake db:seed`

sql_query = <<-SQLQUERY
DROP TABLE IF EXISTS star_wars;

create table star_wars(
       id bigserial primary key,
       character varchar(255) NOT NULL,
       planet varchar(255) NOT NULL,
       vehicle varchar(255) NOT NULL,
       quote varchar(255) NOT NULL
);


COPY star_wars ("character","planet","vehicle","quote") FROM '#{Rails.root}/starwars.csv' DELIMITER ',' CSV HEADER;
SQLQUERY

# ------ starts ruby code again


ActiveRecord::Base.connection.execute(sql_query)

sql_query = "select * from star_wars"

records = ActiveRecord::Base.connection.execute(sql_query)

puts "Created #{records.count} records"
