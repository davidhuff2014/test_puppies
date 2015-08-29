class DynaTablePage
  include PageObject

  page_url "http://127.0.0.1:8888/DynaTable.html"

  button(:none, value: 'None')
  checkbox(:sunday, id: 'gwt-uid-1')
  checkbox(:monday, id: 'gwt-uid-2')
  checkbox(:tuesday, id: 'gwt-uid-3')
  checkbox(:wednesday, id: 'gwt-uid-4')
  checkbox(:thursday, id: 'gwt-uid-5')
  checkbox(:friday, id: 'gwt-uid-6')
  checkbox(:saturday, id: 'gwt-uid-7')
  table(:dyna_table, class: 'table')

  def select_schedule_for(day_of_week)
    none
    self.send "check_#{ day_of_week.downcase }"
  end

  # def class_schedule_for(person)
  #   row = nil
  #   wait_until(2) do
  #     row = dyna_table_element.find { |row| row[0].text == person }
  #   end
  #   row[2].text
  # end

  # def class_schedule_for(person)
  #   row = nil
  #   wait_until(2) do
  #     row = dyna_table_element[person]
  #   end
  #   row[2].text
  # end

  def class_schedule_for(person)
    schedule = nil
    wait_until(2) do
      schedule = dyna_table_element[person]['Schedule'].text
    end
    # needs this because of the wait
    schedule
  end
end