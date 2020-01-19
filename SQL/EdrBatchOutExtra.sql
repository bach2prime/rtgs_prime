USE [RTGS_DB]
GO

/****** Object:  View [dbo].[EdrBatchOutExtra]    Script Date: 01/19/20 12:09:25 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[EdrBatchOutExtra]
AS
SELECT     dbo.EdrOut.EdrOutId, dbo.EdrOut.Amount, dbo.EdrOut.Currency, dbo.EdrOut.SenderAccount, dbo.EdrOut.SenderName, dbo.EdrOut.ReceiverAccount, 
                      dbo.EdrOut.ReceiverName, dbo.EdrOut.ItemType, dbo.EdrOut.TransactionId, dbo.EdrOut.InstEndToEndId, dbo.EdrOut.SettlementDate, dbo.EdrOut.Status, 
                      dbo.EdrOut.ServiceLevel, dbo.EdrOut.LocalInstrument, dbo.EdrOut.CategoryPurpose, dbo.EdrOut.AdviceNo, dbo.EdrOut.ReturnReason, dbo.EdrOut.CreationDate, 
                      dbo.EdrOut.MakerName, dbo.Branch.BranchId, dbo.Branch.BankCode, dbo.Branch.RoutingNumber, dbo.Branch.BranchName, dbo.Branch.BranchShortName, 
                      dbo.Branch.PrivateBranchCode, ob.RoutingNo AS OtherRoutingNo, ob.BranchName AS OtherBranchName, ob.BankCodeFK AS OtherBankCode, 
                      dbo.Bank.ShortName AS OtherBankName, dbo.Bank.SwiftCode AS OtherBankSwiftCode, dbo.EdrOut.ReturnReasonInfo, dbo.EdrOut.Purpose, 
                      dbo.EdrOut.CbsTxIdParking, dbo.EdrOut.RemittanceInfo, dbo.EdrOut.InstructionForNextAgent, dbo.EdrOut.InternetBankingId,
					  extra.Bin, extra.Challan
FROM         dbo.EdrOut INNER JOIN
                      dbo.Branch ON dbo.EdrOut.OwnBranch = dbo.Branch.BranchId INNER JOIN
                      dbo.OtherBranch AS ob ON dbo.EdrOut.OtherBranch = ob.RoutingNo INNER JOIN
                      dbo.Bank ON ob.BankCodeFK = dbo.Bank.BankCode left outer join
					  dbo.EdrOutExtraData as extra on extra.EdrOutId = dbo.EdrOut.EdrOutId


GO


