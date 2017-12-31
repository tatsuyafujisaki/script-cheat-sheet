function GetJapaneseWeekdayName($date) {
  switch ($date.DayOfWeek.Value__) {
    0 { "日" }
    1 { "月" }
    2 { "火" }
    3 { "水" }
    4 { "木" }
    5 { "金" }
    6 { "土" }
  }
}

$subject = "日報 - " + (Get-Date -Format "M月dd日(") + (GetJapaneseWeekdayName (Get-Date)) + ")"

Send-MailMessage `
  -From "me@example.com" `
  -To "boss@example.com" `
  -Bcc $me `
  -SmtpServer "smtp.example.com" `
  -Encoding ([System.Text.Encoding]::UTF8) `
  -Subject $subject `
  -Body "Foo"