document.getElementById('creationCompteForm').addEventListener('submit', function(event) {
    event.preventDefault();
    const formData = new FormData(this);
    const requestBody = {};
    formData.forEach((value, key) => {
        requestBody[key] = value;
    });

    fetch('https://api-tache.onrender.com/api/utilisateurs', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(requestBody)
    })
    .then(response => handleResponse(response))
    .catch(error => {
        console.error('Erreur:', error);
    });
});

document.getElementById('nouvelleCleForm').addEventListener('submit', function(event) {
    event.preventDefault();
    const formData = new FormData(this);
    const requestBody = {};
    formData.forEach((value, key) => {
        requestBody[key] = value;
    });
    console.log(requestBody);
    fetch('https://api-tache.onrender.com/api/utilisateurs/nouvelleCle', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(requestBody)
    })
    .then(response => handleResponse(response))
    .catch(error => {
        console.error('Erreur:', error);
    });
});

function handleResponse(response) {
    response.json()
        .then(data => {
            if (response.ok) {
                afficherResultat(data);
            } else {
                afficherErreur(data);
            }
        })
        .catch(error => {
            console.error('Erreur:', error);
        });
}

function afficherResultat(data) {
    if (data) {
        document.getElementById('responseContainer').innerHTML = '<div class="contour">' + formaterJSON(data) + '</div>';
    }
}

function afficherErreur(data) {
    if (data) {
        document.getElementById('responseContainer').innerHTML = '<div class="contour">' + formaterJSON(data, true) + '</div>';
    }
}

function formaterJSON(data, addRed) {
    let message = '';
    const colorStyle = addRed ? 'style="color: red;"' : '';
    for (const key in data) {
        message += '<p ' + colorStyle + '>' + key + ': ' + data[key] + '</p>';
    }
    return message;
}
