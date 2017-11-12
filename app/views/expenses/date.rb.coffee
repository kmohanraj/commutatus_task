joinDate = $('#user_join_date')
joinDate.blur ->
  regex=/(\d{2})\/(\d{2})\/(\d{4})/
  m=regex.exec(joinDate.val())
  console.log m
  probationDate = new Date(m[3], m[2]-1, m[1])
  console.log probationDate
  myVar = new Date(probationDate.setMonth probationDate.getMonth() + 6)
  $('#user_probation_end_date').val(myVar)