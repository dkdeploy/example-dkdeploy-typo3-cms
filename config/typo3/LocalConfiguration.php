<?php
return [
    'BE' => [
        'debug' => false,
        'explicitADmode' => 'explicitAllow',
        'versionNumberInFilename' => false,
    ],
    'EXT' => [
        'allowLocalInstall' => '0',
    ],
    'EXTCONF' => [
        'lang' => [
            'availableLanguages' => [],
        ],
    ],
    'FE' => [
        'debug' => false,
    ],
    'GFX' => [
    ],
    'INSTALL' => [
        'wizardDone' => [
            'TYPO3\\CMS\\Install\\Updates\\BackendUserStartModuleUpdate' => 1,
            'TYPO3\\CMS\\Install\\Updates\\Compatibility6ExtractionUpdate' => 1,
            'TYPO3\\CMS\\Install\\Updates\\FileListIsStartModuleUpdate' => 1,
            'TYPO3\\CMS\\Install\\Updates\\LanguageIsoCodeUpdate' => 1,
            'TYPO3\\CMS\\Install\\Updates\\ProcessedFileChecksumUpdate' => 1,
        ],
    ],
    'LOG' => [
        'writerConfiguration' => [
            \TYPO3\CMS\Core\Log\LogLevel::WARNING => '__UNSET',
            \TYPO3\CMS\Core\Log\LogLevel::ERROR => [
                \TYPO3\CMS\Core\Log\Writer\SyslogWriter::class => [
                    'facility' => 'user'
                ]
            ]
        ],
        'TYPO3' => '__UNSET'
    ],
    'SYS' => [
        'clearCacheSystem' => false,
        'devIPmask' => '',
        'displayErrors' => 0,
        'doNotCheckReferer' => true,
        'enableDeprecationLog' => '',
        'fileCreateMask' => '0660',
        'folderCreateMask' => '0770',
        'isInitialInstallationInProgress' => false,
        'phpTimeZone' => 'Europe/Berlin',
        'sitename' => 'Example dkdeploy TYPO3 CMS',
    ],
];
