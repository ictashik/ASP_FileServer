<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AppMaster.Master" AutoEventWireup="true" CodeBehind="FileList.aspx.cs" Inherits="BYNCO_JET.FileList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script src="../js/jquery-2.1.1.js"></script>

    <script type="text/javascript">

        $(document).ready(function () {

            $(".selectDDL").select2({
                placeholder: "Select",
                allowClear: true
            });

            //to run the script after postback
            var prm = Sys.WebForms.PageRequestManager.getInstance();

            prm.add_endRequest(function () {
                $(".selectDDL").select2({
                    placeholder: "Select",
                    allowClear: true
                });

                $('.dataTables-example').DataTable({
                    dom: '<"html5buttons"B>lTfgitp',
                    buttons: [
                        { extend: 'copy' },
                        { extend: 'csv' },
                        { extend: 'excel', title: 'ExampleFile' },
                        { extend: 'pdf', title: 'ExampleFile' },

                        {
                            extend: 'print',
                            customize: function (win) {
                                $(win.document.body).addClass('white-bg');
                                $(win.document.body).css('font-size', '10px');

                                $(win.document.body).find('table')
                                    .addClass('compact')
                                    .css('font-size', 'inherit');
                            }
                        }
                    ]

                });
            });
        });

        function ConfirmDeletion() {
            var a = confirm("Are you sure to delete this record?")
            if (a == true) { return true; }
            else {
                return false;
            }
        }

    </script>

    <div class="wrapper wrapper-content animated fadeInRight">
        <asp:UpdatePanel ID="updData" UpdateMode="Conditional" runat="server">

            <ContentTemplate>

                <div class="alert alert-success alert-dismissable" id="divSuccessAlert" runat="server" visible="false">
                    <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
                    <asp:Literal ID="litSucessMessage" runat="server"></asp:Literal>
                </div>
                <div class="alert alert-danger alert-dismissable" id="divFailureAlert" runat="server" visible="false">
                    <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
                    <asp:Literal ID="litFailureMessage" runat="server"></asp:Literal>
                </div>

                <asp:HiddenField ID="hfUserType" Value="" runat="server" />
                <asp:HiddenField ID="hfLOKConstituency" Value="" runat="server" />

                <div class="row">
                    <div class="col-lg-12">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <h2> <strong> Previous Year Question Papers</strong></h2>
                            </div>

                            <div class="ibox-content">

                                <div class="table-responsive">
                                    <asp:Repeater ID="rptData" runat="server">
                                        <HeaderTemplate>
                                            <table class="table table-striped table-bordered table-hover dataTables-example">
                                                <thead>
                                                    <tr>
                                                        <th>File Name</th>
                                                        <th style="width:20px"> </th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                        </HeaderTemplate>

                                        <ItemTemplate>
                                            <tr class="gradeX">
                                                <td><%# Eval("Text") %> </td>
                                                <td class="td-center">
                                                    <asp:LinkButton ID="lnkDownload" CommandArgument='<%# Eval("Value") %>' runat="server" OnClick="DownloadFile"><i class="fa fa-download"></i></asp:LinkButton>
                                                </td>
                                            </tr>

                                        </ItemTemplate>

                                        <FooterTemplate>
                                            </table>
                                        </FooterTemplate>

                                    </asp:Repeater>


                                    <div class="alert alert-warning alert-dismissable" id="div1" runat="server" visible="false">
                                        <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
                                        <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                                    </div>
                                </div>

                            </div>

                        </div>
                    </div>
                </div>
            </ContentTemplate>

            <Triggers>
                <%--<asp:AsyncPostBackTrigger ControlID="btnSearch" />--%>
            </Triggers>

        </asp:UpdatePanel>
    </div>

</asp:Content>
