<div>
    <br>
    <form method="post" action="{{ route('search') }}">
        @csrf
        <div class="input-group mb-3">
            <input name="search_key" type="text" class="form-control" placeholder="Search" aria-label="Search"
                   aria-describedby="button-addon2">
            <div class="input-group-append">
                <button class="btn btn-outline-secondary" type="submit" id="button-addon2">Button</button>
            </div>
        </div>
    </form>
</div>
