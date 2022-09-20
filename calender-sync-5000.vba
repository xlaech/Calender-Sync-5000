Public WithEvents ReceivedItems As Outlook.Items

'Hook to review event
Private Sub Application_Startup()
    Set ReceivedItems = Outlook.Application.Session.GetDefaultFolder(olFolderInbox).Items
End Sub

Private Sub ReceivedItems_ItemAdd(ByVal Item As Object)
    Dim xMeetingItem As MeetingItem
    Dim xForwardMeeting As MeetingItem
    On Error Resume Next

    'Forward all calender Items
    If TypeOf Item Is MeetingItem Then
        MsgBox ("Syncing Calender Item")
        Set xMeetingItem = Item
        Set xForwardMeeting = xMeetingItem.Forward
        With xForwardMeeting
            'STEP 1: Clean Recipients
            Dim r As recipient
            For Each r In .Recipients
                r.Delete
            Next r
            With .Recipients
                .Add my.email@company.com 'change address to your own
                .ResolveAll
            End With
            
            'STEP 2: Clean Subject
            .Subject = "MyClient Meeting" 'change company Name

            'STEP 3: Clean Body
            .Body = "removed due to compliance"
            
            'STEP 4: Clean Attachments
            Dim a As Attachment
            For Each a In .Attachments
                a.Delete
            Next a
            
            'STEP 5: Send
            .Send
        End With
    End If
End Sub
