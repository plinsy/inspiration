function search() {
    $searchBar = $(`#search-bar`);
    $resultDiv = $(`[data-target="searches-result"]`);
    $mainDiv = $(`#main`);
};

function startSearch(name, type="users") {
    let auth = $(`input[name="authenticity_token"]`).val();
    $.ajax({
        url: '/rechercher',
        type: 'POST',
        dataType: 'script',
        data: {
            authenticity_token: auth,
            'search[type]': type,
            'search[name]': name
        }
    });
};

jQuery(document).ready(function($) {
    $searchBtn = $(`#start-search-btn`);
    $searchInput = $(`#search-input`);
    $searchConversationInput = $(`#search-conversations-input`);
    $resultDiv = $(`[data-target="searches-result"]`);
    
    search();

    $searchInput.keyup(function(event) {
        event.preventDefault();
        $name = $(this).val();
        startSearch($name);
        search();
    });

    $searchConversationInput.keyup(function(event) {
        event.preventDefault();
        $name = $(this).val();
        startSearch($name, "conversations");
        search();
    });

    $searchBtn.click(function(event) {
        event.preventDefault();
        $searchBar.toggleClass('hide');
        if ($searchBar.hasClass('hide')) {
            $resultDiv.html(``);
        } else {
            $searchInput.focus();
        }
        search();
    });
});