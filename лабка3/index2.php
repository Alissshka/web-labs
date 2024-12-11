<?php
session_start();


$my_email = "bloodydie.dragon18@gmail.com";
$my_pass = "qwsxdrtgb28";

if (!empty($_GET['logout']) && $_GET['logout'] === "yes") {
    session_unset();
    session_destroy();
    header("Location: /");
    exit;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $user_email = $_POST['email'] ?? '';
    $user_pass = $_POST['pass'] ?? '';

    if ($user_email === $my_email && $user_pass === $my_pass) {
        $_SESSION['username'] = $user_email;
        $_SESSION['authenticated'] = true;
        header("Location: /");
        exit;
    } else {
        $error_message = "Invalid email or password.";
    }
}

$is_authenticated = $_SESSION['authenticated'] ?? false;
?>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Session Demo - Purple Theme</title>
    <style>
        body {
            background-color: #1e1b29;
            font-family: 'Arial', sans-serif;
            color: #e4e1ef;
            margin: 0;
            padding: 0;
        }
        .container {
            margin-top: 50px;
        }
        .btn-primary {
            background-color: #6a0dad;
            border: none;
            color: #fff;
        }
        .btn-primary:hover {
            background-color: #551a8b;
        }
        .btn-danger {
            background-color: #d12090;
            border: none;
            color: #fff;
        }
        .btn-danger:hover {
            background-color: #b21878;
        }
        h2 {
            color: #c084f5;
        }
        .form-label {
            color: #b8b5cf;
        }
        .alert-danger {
            background-color: #4a1942;
            color: #ffccd5;
        }
        .form-control {
            background-color: #2c2840;
            border: 1px solid #6a0dad;
            color: #e4e1ef;
        }
        .form-control:focus {
            border-color: #c084f5;
            box-shadow: 0 0 5px #c084f5;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <?php if (!$is_authenticated): ?>
                <h2 class="text-center">Login</h2>
                <?php if (!empty($error_message)): ?>
                    <div class="alert alert-danger" role="alert">
                        <?= htmlspecialchars($error_message) ?>
                    </div>
                <?php endif; ?>
                <form method="POST" action="/">
                    <div class="mb-3">
                        <label for="email" class="form-label">Email Address</label>
                        <input type="email" name="email" class="form-control" id="email" placeholder="name@example.com" required>
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" name="pass" class="form-control" id="password" placeholder="Password" required>
                    </div>
                    <button type="submit" class="btn btn-primary w-100">Login</button>
                </form>
            <?php else: ?>
                <h2 class="text-center">Welcome Back</h2>
                <p class="text-center">You have successfully logged in.</p>
                <div class="text-center">
                    <a href="/?logout=yes" class="btn btn-danger">Logout</a>
                </div>
            <?php endif; ?>
        </div>
    </div>
</div>
</body>
</html>