# Note
* Unicode Native Format (for multibyte chars) is available in SQL Server 2012 or higher.
  * [Use Unicode Native Format to Import or Export Data](https://docs.microsoft.com/en-us/sql/relational-databases/import-export/use-unicode-native-format-to-import-or-export-data-sql-server)
* Use `bcp` with `-d %database%` in SQL Server 2008 R2 or higher.
* In `bcp` or `sqlcmd`, enclose schema names or table names, which contains a hyphen, in brackets (`[]`) or an error occurs.
* In `sqlcmd`, the number of characters of each field is limited to 256 by default.
  * `-y` can change the limit but cannot be used with `-W` that is a must.
* Unlike bcp-out-binary, bcp-in-binary is impossible in DOS if SQL Server and its client are on differnt machines.
* Prepend `SET NOCOUNT ON;` to a SELECT query.
```batch
rem Escape a percent by doubling it.
set query="SET NOCOUNT ON; SELECT * FROM Table1 LIKE '%%foo%%'"
```

# Relationship between `-f` of sqlcmd and code page of `*.sql`
<table>
  <tr>
    <td colspan="2" />
    <td colspan="3">Code page of *.sql</td>
  </tr>
  <tr>
    <td colspan="2" />
    <td>Shift-JIS</td>
    <td>UTF-8 without BOM</td>
    <td>UTF-8 with BOM</td>
  </tr>
  <tr>
    <td rowspan="3">-f option of sqlcmd</td>
    <td>(-f is not used)</td>
    <td>Mojibake</td>
    <td>Mojibake</td>
    <td>OK</td>
  </tr>
    <tr>
    <td>-f 932</td>
    <td>OK</td>
    <td>Mojibake</td>
    <td>OK</td>
  </tr>
    <tr>
    <td>-f 65002</td>
    <td>Mojibake</td>
    <td>OK</td>
    <td>OK</td>
  </tr>
</table>

# References
* [bcp](https://msdn.microsoft.com/en-us/library/ms162802.aspx)
* [sqlcmd](https://msdn.microsoft.com/en-us/library/ms162773.aspx)
