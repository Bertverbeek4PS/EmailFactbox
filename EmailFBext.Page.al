pageextension 70100 "Posted Sales Invoice Email Ext" extends "Customer Card"
{
    layout
    {
        addfirst(Factboxes)
        {
            part(SentEmails; "Sent Emails for Document")
            {
                ApplicationArea = Basic, Suite;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    var
        TempSendEmail: Record "Sent Email" temporary;
        Email: Codeunit Email;
    begin
        Email.GetSentEmailsForRecord(Database::Customer, rec.SystemId, TempSendEmail);
        CurrPage.SentEmails.Page.FillBuffer(TempSendEmail);
    end;
}