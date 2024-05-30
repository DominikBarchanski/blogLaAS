<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
</head>
<body>
@if(Auth::check())
    <h1>Welcome, {{ Auth::user()->name }}!</h1>
    <a href="{{ route('posts.index') }}">Go to Posts</a>
@else
    <h1>Welcome to My Blog</h1>
    <a href="{{ route('login') }}"><button>Login</button></a>
    <a href="{{ route('register') }}"><button>Register</button></a>
@endif
</body>
</html>
