<div class="form-group {{ $errors->has('name') ? 'has-error' : '' }}">
    {{-- use laravel collective package --}}
    {{ Form::label('name', 'Product Name') }}
    {{ Form::text('name', $product->name ,['class' => 'form-control border-input', 'placeholder' => 'Macbook pro']) }}
    {{--<label>Product Name:</label>--}}
    {{--<input name="name" type="text" class="form-control border-input"--}}
    {{--placeholder="Macbook pro">--}}
    <span class="text-danger">{{ $errors->has('name') ? $errors->first('name') : '' }}</span>
</div>

<div class="form-group {{ $errors->has('price') ? 'has-error' : '' }}">
    {{ Form::label('price', 'Price') }}
    {{ Form::text('price', $product->price,['class' => 'form-control border-input', 'placeholder' => '$2500']) }}
    {{--<label>Product Price:</label>--}}
    {{--<input name="price" type="text" class="form-control border-input"--}}
    {{--placeholder="$2500">--}}
    <span class="text-danger">{{ $errors->has('price') ? $errors->first('price') : '' }}</span>
</div>

<div class="form-group {{ $errors->has('description') ? 'has-error' : '' }}">
    {{ Form::label('description', 'Description') }}
    {{ Form::text('description', $product->description,['class' => 'form-control border-input', 'placeholder' => 'Description']) }}
    {{--<label>Product Description:</label>--}}
    {{--<textarea name="description" id="" cols="30" rows="10"--}}
    {{--class="form-control border-input"--}}
    {{--placeholder="Product Description"></textarea>--}}
    <span class="text-danger">{{ $errors->has('description') ? $errors->first('description') : '' }}</span>
</div>

<div class="form-group {{ $errors->has('image') ? 'has-error' : '' }}">
    {{ Form::label('file', 'File') }}
    {{ Form::file('image', ['class' => 'form-control border-input', 'id' => 'image']) }}
    {{--<label>Product Image:</label>--}}
    {{--<input name="image" type="file" class="form-control border-input" id="image">--}}
    <div id="thumb-output"></div>
    <span class="text-danger">{{ $errors->has('image') ? $errors->first('image') : '' }}</span>
</div>
