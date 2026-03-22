function eliminaLibro(id, btn)
{
	if(!confirm('sei sicuro di voler cancellare il libro?')) 
		return;
	
	fetch('libroServlet?id='+id ,
	{
		method:'DELETE'
	})
	.then(response =>
		{
			if(response.ok)
				{
					btn.closest('tr').remove();
				}
				else
					{
						alert('errore');
					}
		})
		.catch(e =>
			{
				console.error('errore:', e);
				alert('errore di rete');
			});
		
	
}