window.onload = function () {
    document.getElementById("download")
        .addEventListener("click", () => {
			
			const invoice = this.document.getElementById("printform");
            console.log(invoice);
            console.log(window);
            var opt = {
                margin: 0,
                filename: 'MySchedule.pdf',
                image: { type: 'jpeg', quality: 0.98 },
                html2canvas: { scale: 3 },
                jsPDF: { unit: 'in', format: 'a4', orientation: 'portrait' }
            };
            html2pdf().from(invoice).set(opt).save();
        })
}