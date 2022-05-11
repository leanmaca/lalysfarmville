window.onload = function () {
    document.getElementById("download")
        .addEventListener("click", () => {
			document.getElementById("printform").style.fontFamily = 'Times New Roman';
            document.getElementById("printform").style.margintop = '0px';
			const invoice = this.document.getElementById("printform");
            console.log(invoice);
            console.log(window);
            var opt = {
                margin: 1,
                filename: 'MySchedule.pdf',
                image: { type: 'jpeg', quality: 0.98 },
                html2canvas: { scale: 2 },
                jsPDF: { unit: 'in', format: 'a4', orientation: 'portrait' }
            };
            html2pdf().from(invoice).set(opt).save();
        })
}