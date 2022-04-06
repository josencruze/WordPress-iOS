import Foundation

/// Site Creation: Allows creation of the site's name.
final class SiteNameStep: WizardStep {
    weak var delegate: WizardDelegate?
    private let creator: SiteCreator

    private(set) lazy var content: UIViewController = {
        return SiteNameViewController(creator: creator)
    }()

    init(siteNameAB: ABTest = ABTest.siteNameV1, creator: SiteCreator) {
        // TODO: Send an event to track the Site Name variant.
        self.creator = creator
    }

    private func didSet(name: String?) {
        if let name = name {
            let currentTagline = creator.information?.tagLine
            creator.information = SiteInformation(title: name, tagLine: currentTagline)
        }

        delegate?.nextStep()
    }
}
