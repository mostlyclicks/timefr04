# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Bikes" do
    describe "Admin" do
      describe "features" do
        refinery_login_with :refinery_user

        describe "features list" do
          before do
            FactoryGirl.create(:feature, :title => "UniqueTitleOne")
            FactoryGirl.create(:feature, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.bikes_admin_features_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.bikes_admin_features_path

            click_link "Add New Feature"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Bikes::Feature.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Title can't be blank")
              Refinery::Bikes::Feature.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:feature, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.bikes_admin_features_path

              click_link "Add New Feature"

              fill_in "Title", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Bikes::Feature.count.should == 1
            end
          end

          context "with translations" do
            before do
              Refinery::I18n.stub(:frontend_locales).and_return([:en, :cs])
            end

            describe "add a page with title for default locale" do
              before do
                visit refinery.bikes_admin_features_path
                click_link "Add New Feature"
                fill_in "Title", :with => "First column"
                click_button "Save"
              end

              it "should succeed" do
                Refinery::Bikes::Feature.count.should == 1
              end

              it "should show locale flag for page" do
                p = Refinery::Bikes::Feature.last
                within "#feature_#{p.id}" do
                  page.should have_css("img[src='/assets/refinery/icons/flags/en.png']")
                end
              end

              it "should show title in the admin menu" do
                p = Refinery::Bikes::Feature.last
                within "#feature_#{p.id}" do
                  page.should have_content('First column')
                end
              end
            end

            describe "add a feature with title for primary and secondary locale" do
              before do
                visit refinery.bikes_admin_features_path
                click_link "Add New Feature"
                fill_in "Title", :with => "First column"
                click_button "Save"

                visit refinery.bikes_admin_features_path
                within ".actions" do
                  click_link "Edit this feature"
                end
                within "#switch_locale_picker" do
                  click_link "Cs"
                end
                fill_in "Title", :with => "First translated column"
                click_button "Save"
              end

              it "should succeed" do
                Refinery::Bikes::Feature.count.should == 1
                Refinery::Bikes::Feature::Translation.count.should == 2
              end

              it "should show locale flag for page" do
                p = Refinery::Bikes::Feature.last
                within "#feature_#{p.id}" do
                  page.should have_css("img[src='/assets/refinery/icons/flags/en.png']")
                  page.should have_css("img[src='/assets/refinery/icons/flags/cs.png']")
                end
              end

              it "should show title in backend locale in the admin menu" do
                p = Refinery::Bikes::Feature.last
                within "#feature_#{p.id}" do
                  page.should have_content('First column')
                end
              end
            end

            describe "add a title with title only for secondary locale" do
              before do
                visit refinery.bikes_admin_features_path
                click_link "Add New Feature"
                within "#switch_locale_picker" do
                  click_link "Cs"
                end

                fill_in "Title", :with => "First translated column"
                click_button "Save"
              end

              it "should show title in backend locale in the admin menu" do
                p = Refinery::Bikes::Feature.last
                within "#feature_#{p.id}" do
                  page.should have_content('First translated column')
                end
              end

              it "should show locale flag for page" do
                p = Refinery::Bikes::Feature.last
                within "#feature_#{p.id}" do
                  page.should have_css("img[src='/assets/refinery/icons/flags/cs.png']")
                end
              end
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:feature, :title => "A title") }

          it "should succeed" do
            visit refinery.bikes_admin_features_path

            within ".actions" do
              click_link "Edit this feature"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            page.should have_content("'A different title' was successfully updated.")
            page.should have_no_content("A title")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:feature, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.bikes_admin_features_path

            click_link "Remove this feature forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Bikes::Feature.count.should == 0
          end
        end

      end
    end
  end
end
