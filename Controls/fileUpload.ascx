<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="fileUpload.ascx.cs" Inherits="FileServer.Controls.fileUpload" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<div class="row">
    
    <div class="col-lg-12">
        <div class="ibox float-e-margins" style="margin-bottom:0;">
            <div class="ibox-content">
                <div class="table-responsive">
                    <asp:Repeater ID="rptData" runat="server" OnItemCommand="rptData_ItemCommand" OnItemDataBound="rptData_ItemDataBound">
                        <HeaderTemplate>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th style="display: none;">ID</th>
                                        <%--<th></th>--%>
                                        <th>File Name</th>
                                        <%-- <th>File Type</th>--%>
                                        <%-- <th>Added On</th>--%>

                                        <th>Delete</th>
                                        <th>Download</th>
                                    </tr>
                                </thead>
                                <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr class="gradeX">
                                <td style="display: none;">
                                    <asp:Literal ID="litID" runat="server"></asp:Literal></td>
                                <%--<td>
                                                    <asp:Image ID="imgData" runat="server" ImageUrl="~/img/rails_logo.png" />
                                                </td>--%>
                                <td>
                                    <asp:Literal ID="litFileName" runat="server"></asp:Literal></td>
                                <%-- <td>
                                                    <asp:Literal ID="litFileType" runat="server"></asp:Literal></td>--%>

                                <%--  <td class="center">
                                        <asp:Literal ID="litAddedOn" runat="server"></asp:Literal></td>--%>

                                <td class="center">
                                    <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete" OnClientClick="return ConfirmDeletion()"><i class="fa fa-trash"></i></asp:LinkButton></td>
                                 <td>
                                    <asp:LinkButton ID="hypDownload" runat="server"><i title="Download" class="fa fa-cloud-download"></i></asp:LinkButton>



                                </td>

                            </tr>

                        </ItemTemplate>

                        <FooterTemplate>
                            </tbody>
                             
                                </table>
                        </FooterTemplate>

                    </asp:Repeater>


                    <div class="alert alert-warning alert-dismissable" id="divNoDataFound" runat="server" visible="false">

                        <asp:Literal ID="litNoDataFound" runat="server"></asp:Literal>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-lg-12">
        <%-- <asp:Button ID="btnShow" runat="server" Text="Attatch File" >--%>
        <div class="ibox float-e-margins">
            <div class="ibox-content" style="text-align:right">
        <button class="btn btn-primary" id="btnShow" runat="server" type="button"><i class="fa fa-upload"></i>&nbsp;&nbsp;<span class="bold">Upload Files</span></button>

                </div>
            </div>
    </div>
</div>
<!-- ModalPopupExtender -->
<cc1:ModalPopupExtender ID="mp1" runat="server" PopupControlID="Panel1" TargetControlID="btnShow"
    CancelControlID="btnClose" BackgroundCssClass="modalBackground">
</cc1:ModalPopupExtender>

<asp:UpdatePanel ID="up1" runat="server">
    <ContentTemplate>

        <asp:Panel ID="Panel1" runat="server" class="wrapper wrapper-content animated fadeInRight" align="center" Style="display: none;">

            <div class="row">

                <div class="col-lg-6">
                    <div>
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content" style ="position:fixed !important;">
                                <div class="modal-header">

                                    <h4 class="modal-title">File Management</h4>

                                </div>
                                <div class="wrapper wrapper-content animated fadeInRight">

                                    <div class="alert alert-success alert-dismissable" id="divSuccessAlert" runat="server" visible="false">
                                        <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
                                        <asp:Literal ID="litSucessMessage" runat="server"></asp:Literal>
                                    </div>
                                    <div class="alert alert-danger alert-dismissable" id="divFailureAlert" runat="server" visible="false">
                                        <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
                                        <asp:Literal ID="litFailureMessage" runat="server"></asp:Literal>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="ibox float-e-margins">
                                                <div class="ibox-title">
                                                    <h5><small>Select File</small></h5>

                                                </div>
                                                <div class="ibox-content">
                                                    <asp:Label ID="lblMsg" runat="server"></asp:Label>

                                                    <asp:FileUpload ID="fuEntity" runat="server" />

                                                    <asp:Label ID="UploadDetails" runat="server" Text=""></asp:Label>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="modal-footer">
                                    <asp:LinkButton ID="UploadButton" runat="server" CssClass="btn btn-primary" Text="Upload Selected" OnClick="btnUpload_Click" />
                                    <%--  <button type="button" class="btn btn-white" data-dismiss="modal">Close</button>--%>
                                    <asp:Button ID="btnClose" runat="server" Text="Close" CssClass="btn btn-white" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>





        </asp:Panel>

    </ContentTemplate>

    <Triggers>

        <asp:PostBackTrigger ControlID="UploadButton" />
    </Triggers>
</asp:UpdatePanel>


<script>
    $(document).ready(function () {
        $('#tblData').DataTable({

            "ordering": false,
            "info": false
        });
    });
</script>
<script type="text/javascript">
    function ConfirmDeletion() {
        var a = confirm("Are you sure you want to delete this record?")
        if (a == true)
        { return true; }
        else
        {
            return false;
        }
    }

    function isInActive() {
        alert("This Building Is Inactive.");
        return false;
    }

</script>

<style type="text/css">
    .modalBackground {
 
    }

    .modalPopup {
     
    }
</style>


