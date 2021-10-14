<?php
namespace Deployer;

require 'recipe/common.php';
require 'recipe/rsync.php';

// Global config
set('allow_anonymous_stats', false);

// Hosts
host('development')
    ->stage('development')
    ->hostname('mw@vpu01-demo.tugraz.at')
    ->set('deploy_path', '/home/mw/demo/deploy/dev-guide')
    -> set('rsync',[
        'exclude'      => [],
        'exclude-file' => false,
        'include'      => [],
        'include-file' => false,
        'filter'       => [],
        'filter-file'  => false,
        'filter-perdir'=> false,
        'flags'        => 'rz',
        'options'      => ['delete'],
        'timeout'      => 60,
    ])
    -> set('rsync_src', __DIR__ . '/../dist')
    -> set('rsync_dest','{{release_path}}');

// Deploy task
task('deploy', [
    'deploy:info',
    'deploy:prepare',
    'deploy:lock',
    'deploy:release',
    'rsync',
    'deploy:shared',
    'deploy:symlink',
    'deploy:unlock',
    'cleanup',
    'success',
]);
after('deploy:failed', 'deploy:unlock');
