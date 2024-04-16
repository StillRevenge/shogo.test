<?php require_once './views/template/header.php' ?>
<main class="main py-3">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <?php foreach ($posts as $post) : ?>
                    <div class="card" style="width: 18rem;">
                        <img src="..." class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title"><?= $post['title'] ?></h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary">Go somewhere</a>
                        </div>
                    </div>
                <?php endforeach; ?>
            </div>
            <?php require_once './views/template/sidebar.php' ?>
        </div>
    </div>
</main>
<?php require_once './views/template/footer.php' ?>