# About Calender-Sync 5000

For people working in client environments setups might occure, in which they are forced to work on a client workstation, while not beeing allowed to share calender invites with their work account due to compliance not allowing the sharing of information with the external account. These makes it very difficult to keep an overview of all the different meetings in both companies.

This small script ensures that all your client calender entries are synced to your main account while making sure that:
- it runs without prerequesites
- no information (header, body, other recipients, attachments) are forwarded

At the moment the original senders name is not removed. I might address this in a later release.

# How to install



Search for "Visual Basic-Editor" in the search bar on top of outlook and open it. Double click on "ThisOutlookSession" on the left and insert the code.

![Adding the code to Outlook](https://github.com/xlaech/Calender-Sync-5000/blob/master/screenshot.png)

In the code change the following 2 lines to match your situation:

```vba
.Add my.email@company.com 'change address to your own
.Subject = "MyClient Meeting" 'change Company Name
```

# How to run

After the code is beeing inserted the script runs everytime a new calender item is recieved and forwardes a compliant version of the entry.

Warning:
- If you run this script on both accounts you would create an unending forwarding loop ;)
