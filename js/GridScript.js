
      $(document).ready(function(){
          $('.dataTables-example').DataTable({
              dom: '<"html5buttons"B>lTfgitp',
              "lengthMenu": [[30, 60, 100, -1], [30, 60, 100, "All"]],
              buttons: [
                  { extend: 'copy'},
                  {extend: 'csv'},
                  {extend: 'excel', title: 'ExampleFile'},
                  {extend: 'pdf', title: 'ExampleFile'},

                  {extend: 'print',
                      customize: function (win){
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

